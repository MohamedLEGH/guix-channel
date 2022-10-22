;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2013, 2014, 2015, 2016, 2017, 2018, 2019 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2015, 2016, 2017, 2018, 2019, 2020 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2016, 2017, 2018, 2019 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017, 2018 Nikita <nikita@n0.is>
;;; Copyright © 2017, 2018 ng0 <gillmann@infotropique.org>
;;; Copyright © 2017, 2018, 2020 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018, 2020, 2022 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2019 Ivan Petkov <ivanppetkov@gmail.com>
;;; Copyright © 2020 Oleg Pykhalov <go.wigust@gmail.com>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2019, 2020 Adrian Malacoda <malacoda@monarch-pass.net>
;;; Copyright © 2020-2022 Jonathan Brielmaier <jonathan.brielmaier@web.de>
;;; Copyright © 2020 Zhu Zihao <all_but_last@163.com>
;;; Copyright © 2021 pineapples <guixuser6392@protonmail.com>
;;; Copyright © 2021 Brice Waegeneire <brice@waegenei.re>
;;; Copyright © 2021, 2022 John Kehayias <john.kehayias@protonmail.com>
;;; Copyright © 2022 Pierre Langlois <pierre.langlois@gmx.com>
;;;
;;; This file is not part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (mohamed packages firefox)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix build utils) #:select (alist-replace))

  #:use-module (gnu packages)
  #:use-module (nongnu packages mozilla)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg))

(define-public firefox-105
  (package
    (inherit firefox-esr)
    (name "firefox")
    (version "105.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://archive.mozilla.org/pub/firefox/releases/"
                           version "/source/firefox-" version ".source.tar.xz"))
       (sha256
        (base32 "063ybmz4skn8wlgzpir2kk4a76nnkr8jdmly8wblz0askpyynihm"))))
    (arguments
     (substitute-keyword-arguments (package-arguments firefox-esr)
       ((#:phases phases)
        #~(modify-phases #$phases
            (replace 'set-build-id
              (lambda _
                (setenv "MOZ_BUILD_DATE" #$%firefox-build-id)))))))
    (native-inputs
     (modify-inputs (package-native-inputs firefox-esr)
       (replace "rust" rust-firefox)
       (replace "rust:cargo" `(,rust-firefox "cargo"))
       (replace "node" node-lts)
       (replace "rust-cbindgen" rust-cbindgen-0.24)))
    (description
     "Full-featured browser client built from Firefox source tree, without
the official icon and the name \"firefox\".")))

(define-public firefox/wayland-105
  (package
    (inherit firefox)
    (name "firefox-wayland")
    (native-inputs '())
    (inputs
     `(("bash" ,bash-minimal)
       ("firefox" ,firefox)))
    (build-system trivial-build-system)
    (arguments
     '(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((bash    (assoc-ref %build-inputs "bash"))
                (firefox (assoc-ref %build-inputs "firefox"))
                (out     (assoc-ref %outputs "out"))
                (exe     (string-append out "/bin/firefox")))
           (mkdir-p (dirname exe))

           (call-with-output-file exe
             (lambda (port)
               (format port "#!~a
MOZ_ENABLE_WAYLAND=1 exec ~a $@\n"
                       (string-append bash "/bin/bash")
                       (string-append firefox "/bin/firefox"))))
           (chmod exe #o555)

           ;; Provide the manual and .desktop file.
           (copy-recursively (string-append firefox "/share")
                             (string-append out "/share"))
           (substitute* (string-append
                         out "/share/applications/firefox.desktop")
             ((firefox) out))
           #t))))))
