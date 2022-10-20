(define-module (mohamed packages crates)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages sequoia)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages crates-io)
  #:use-module (srfi srfi-1))

(define-public rust-linux-raw-sys-0.0.46
  (package
    (name "rust-linux-raw-sys")
    (version "0.0.46")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "linux-raw-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0kc528mp2fp8m96csm6rmwg0ac7zbgf36k19ml4a4c9j6xn4blnl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))
       #:cargo-development-inputs (("rust-libc" ,rust-libc-0.2)
                                   ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/sunfishcode/linux-raw-sys")
    (synopsis "Generated bindings for Linux's userspace API")
    (description "Generated bindings for Linux's userspace API")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-io-lifetimes-1
  (package
    (name "rust-io-lifetimes")
    (version "1.0.0-rc1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "io-lifetimes" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1pwgq3gsbqr99x7prsl5b3lh1yzxvdplxaqpg63yd65asghxlrbg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-async-std" ,rust-async-std-1)
                       ("rust-fs-err" ,rust-fs-err-2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-os-pipe" ,rust-os-pipe-1)
                       ("rust-socket2" ,rust-socket2-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.36))))
    (home-page "https://github.com/sunfishcode/io-lifetimes")
    (synopsis "A low-level I/O ownership and borrowing library")
    (description
     "This package provides a low-level I/O ownership and borrowing library")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-rustix-0.35
  (package
    (name "rust-rustix")
    (version "0.35.11")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "rustix" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vvw8565cv1dnwi74iw5884a2hif82mk2m5hn4ri9vvdcsjgvcpv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-errno" ,rust-errno-0.2)
                       ("rust-io-lifetimes" ,rust-io-lifetimes-1)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.0.46)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.36))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.3)
                                   ("rust-ctor" ,rust-ctor-0.1)
                                   ("rust-errno" ,rust-errno-0.2)
                                   ("rust-flate2" ,rust-flate2-1)
                                   ("rust-io-lifetimes" ,rust-io-lifetimes-1)
                                   ("rust-libc" ,rust-libc-0.2)
                                   ("rust-memoffset" ,rust-memoffset-0.6)
                                   ("rust-serial-test" ,rust-serial-test-0.6)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/bytecodealliance/rustix")
    (synopsis "Safe Rust bindings to POSIX/Unix/Linux/Winsock2-like syscalls")
    (description
     "Safe Rust bindings to POSIX/Unix/Linux/Winsock2-like syscalls")
    (license (list license:asl2.0 license:asl2.0
                   license:expat))))

(define-public rust-unic-emoji-char-0.9
  (package
    (name "rust-unic-emoji-char")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "unic-emoji-char" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0ka9fr7s6lv0z43r9xphg9injn35pfxf9g9q18ki0wl9d0g241qb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-unic-char-property" ,rust-unic-char-property-0.9)
                       ("rust-unic-char-range" ,rust-unic-char-range-0.9)
                       ("rust-unic-ucd-version" ,rust-unic-ucd-version-0.9))))
    (home-page "https://github.com/open-i18n/rust-unic/")
    (synopsis "UNIC â Unicode Emoji â Emoji Character Properties")
    (description "UNIC â Unicode Emoji â Emoji Character Properties")
    (license (list license:expat license:asl2.0))))

(define-public rust-terminal-size-0.2
  (package
    (name "rust-terminal-size")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "terminal-size" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "18f57ag083ckf460wyhp34jdh193rhxrh2ja9qbgdpkrrxhchh44"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-rustix" ,rust-rustix-0.35)
                       ("rust-windows-sys" ,rust-windows-sys-0.36))))
    (home-page "https://github.com/eminence/terminal-size")
    (synopsis "Gets the size of your Linux or Windows terminal")
    (description "Gets the size of your Linux or Windows terminal")
    (license (list license:expat license:asl2.0))))

(define-public rust-textwrap-0.15
  (package
    (name "rust-textwrap")
    (version "0.15.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "textwrap" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "05jvh74g11f90s5fwaj74c6sxqs8nj5f01rf5s0yxx0vrz01g5cl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-hyphenation" ,rust-hyphenation-0.8)
                       ("rust-smawk" ,rust-smawk-0.3)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.3)
                                   ("rust-lipsum" ,rust-lipsum-0.8)
                                   ("rust-termion" ,rust-termion-1)
                                   ("rust-unic-emoji-char" ,rust-unic-emoji-char-0.9)
                                   ("rust-version-sync" ,rust-version-sync-0.9))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
     "Library for word wrapping, indenting, and dedenting strings. Has optional support for Unicode and emojis as well as machine hyphenation.")
    (description
     "Library for word wrapping, indenting, and dedenting strings.  Has optional
support for Unicode and emojis as well as machine hyphenation.")
    (license license:expat)))

(define-public rust-clap-lex-0.2
  (package
    (name "rust-clap-lex")
    (version "0.2.2")
    (source
      (origin
      (method url-fetch)
      (uri (crate-uri "clap_lex" version))
      (file-name (string-append name "-" version ".tar.gz"))
      (sha256
        (base32
        "04rn568mpbc4smk1wlsh9ky4z12b53rgiv6g6i1fpssh0ikcsf2m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Test tarballs not included in crate.
       #:cargo-inputs
       (("rust-os-str-bytes" ,rust-os-str-bytes-6))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis " Minimal, flexible command line parser ")
    (description
     " Minimal, flexible command line parser ")
    (license (list license:asl2.0
                   license:expat))))


(define-public rust-tar-0.4
  (package
    (name "rust-tar")
    (version "0.4.38")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tar" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1ikiz14wbfmaaw5mrv93msa8v6n3i595z5kw9p0fdqa40dy80mab"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Test tarballs not included in crate.
       #:cargo-inputs
       (("rust-filetime" ,rust-filetime-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-xattr" ,rust-xattr-0.2))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/alexcrichton/tar-rs")
    (synopsis "Tar file reading/writing for Rust")
    (description
     "This package provides a Rust implementation of a TAR file reader and
writer.  This library does not currently handle compression, but it is abstract
over all I/O readers and writers.  Additionally, great lengths are taken to
ensure that the entire contents are never required to be entirely resident in
memory all at once.")
    (license (list license:asl2.0
                   license:expat))))

(define-public rust-rustfix-0.6
  (package
    (name "rust-rustfix")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustfix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0apkjxv3z70vhnyz2kpwsivvndk6qk7kkp0rf7sg8pk7q1gy02vg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))
       #:cargo-development-inputs
       (("rust-difference" ,rust-difference-2)
        ("rust-duct" ,rust-duct-0.13)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-proptest" ,rust-proptest-0.9)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/rust-lang/rustfix")
    (synopsis "Automatically apply the suggestions made by rustc")
    (description
     "Automatically apply the suggestions made by rustc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-info-3
  (package
    (name "rust-os-info")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os_info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qnvpw6w53ma5na0k969fl5nz89qn90wb7ipv71i47j8w753xjhf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-pretty-assertions" ,rust-pretty-assertions-0.7))
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/stanislav-tkach/os_info")
    (synopsis "Detect the operating system type and version")
    (description
     "This library detects the operating system type and version.")
    (license license:expat)))

(define-public rust-opener-0.5
  (package
    (name "rust-opener")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opener" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lkrn4fv1h4m8gmp7ll6x7vjvb6kls2ngwa5cgsh2ix5fb6yp8sf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Seeker14491/opener")
    (synopsis "Open a file or link using the system default program")
    (description "This crate provides the ability to open a file or link with
the default program configured on the system.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jobserver-0.1
  (package
    (name "rust-jobserver")
    (version "0.1.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jobserver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yn1vxbbqv7dqir6qbfcj8h8ddjf89m5mhvm36h13xx7k5raf9dg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-tokio-core" ,rust-tokio-core-0.1)
        ("rust-tokio-process" ,rust-tokio-process-0.2))))
    (home-page "https://github.com/alexcrichton/jobserver-rs")
    (synopsis "GNU make jobserver for Rust")
    (description
     "An implementation of the GNU make jobserver for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-curl-sys-0.4
  (package
    (name "rust-curl-sys")
    (version "0.4.55+curl-7.83.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "curl-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0qi77rzdv4bbl1600akdpqxbk62w1q5kzpb15qy5iv38fg3lwwr3"))
        (modules '((guix build utils)))
        (snippet
         '(begin (delete-file-recursively "curl") #t))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libnghttp2-sys" ,rust-libnghttp2-sys-0.1)
        ("rust-libz-sys" ,rust-libz-sys-1)
        ("rust-mesalink" ,rust-mesalink-1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-cc" ,rust-cc-1)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))
       #:cargo-development-inputs
       (("rust-cfg-if" ,rust-cfg-if-1))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list curl nghttp2 openssl zlib))
    (home-page "https://github.com/alexcrichton/curl-rust")
    (synopsis "Native bindings to the libcurl library")
    (description
     "This package provides native bindings to the @code{libcurl} library.")
    (license license:expat)))

(define-public rust-curl-0.4
  (package
    (name "rust-curl")
    (version "0.4.43")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "curl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "07v5s3qafyl9gnnlzbddgg5fzy41gncy00ahbbv46nr0xyp5bn1p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #false                  ;require internet access
       #:cargo-inputs
       (("rust-curl-sys" ,rust-curl-sys-0.4)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-schannel" ,rust-schannel-0.1)
        ("rust-socket2" ,rust-socket2-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-extras" ,rust-mio-extras-2))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list curl nghttp2 openssl zlib))
    (home-page "https://github.com/alexcrichton/curl-rust")
    (synopsis "Rust bindings to libcurl for making HTTP requests")
    (description
     "This package provides Rust bindings to libcurl for making HTTP
requests")
    (license license:expat)))

(define-public rust-crates-io-0.34
  (package
    (name "rust-crates-io")
    (version "0.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crates-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "139jnq0bp507sj5na86iw0qbqfahwm5v7ajy344fgcikj52qfjkb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-curl" ,rust-curl-0.4)
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-url" ,rust-url-2))))
    (native-inputs
     (list curl openssl pkg-config zlib))
    (home-page "https://github.com/rust-lang/cargo")
    (synopsis "Helpers for interacting with @url{crates.io}")
    (description "This package provides helpers for interacting with
@url{crates.io}.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-3
  (package
    (name "rust-clap")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jf5yh8321zqhxzcz5fdhjjqrxxr5682z2lsj3gpsbzmlmpmcdm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-clap-derive" ,rust-clap-derive-3)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-os-str-bytes" ,rust-os-str-bytes-2)
        ("rust-strsim" ,rust-strsim-0.10)
        ("rust-termcolor" ,rust-termcolor-1)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-textwrap" ,rust-textwrap-0.15)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-clap-lex" ,rust-clap-lex-0.2)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://clap.rs/")
    (synopsis "Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured
Command Line Argument Parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-libgit2-sys-0.13
  (package
    (name "rust-libgit2-sys")
    (version "0.13.2+1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libgit2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12r5dy45v42yc67qwj0qcky84dd45syack0fzh02xhd5a6ddwhis"))
       (modules '((guix build utils)))
       (snippet
        '(begin (delete-file-recursively "libgit2")))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libgit2 openssl zlib))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Native bindings to the libgit2 library")
    (description
     "This package provides native Rust bindings to the @code{libgit2}
library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-git2-curl-0.15
  (package
    (name "rust-git2-curl")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2-curl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04qvn4qws9vx8i2zrqnx7dsrd4gvj2i8b8z2dyxiyd2c6q4igr8y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t                 ;need rust-civet and others
       #:cargo-inputs
       (("rust-curl" ,rust-curl-0.4)
        ("rust-git2" ,rust-git2-0.13)
        ("rust-log" ,rust-log-0.4)
        ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Libgit2 HTTP transport backend powered by @code{libcurl}")
    (description "Backend for an HTTP transport in @code{libgit2}, powered by
libcurl, which is intended to be used with the @code{git2} crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-git2-0.14
  (package
    (name "rust-git2")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g4ydsshmb3a4ad96ss7ydrr55i384jckixzq90plp91wbhac9iq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.12)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-url" ,rust-url-2))
       #:cargo-development-inputs
       (("rust-paste" ,rust-paste-1)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-time" ,rust-time-0.1))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("git" ,git-minimal)))           ;for a single test
    (inputs
     (list libgit2-1.3 libssh2 openssl zlib))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Rust bindings to libgit2")
    (description
     "This package provides bindings to libgit2 for interoperating with git
repositories.  This library is both threadsafe and memory safe and allows both
reading and writing git repositories.")
    (license (list license:expat license:asl2.0))))


(define-public rust-cargo-util-0.2
  (package
    (name "rust-cargo-util")
    (version "0.2.1")
    (source
      (origin
      (method url-fetch)
       (uri (crate-uri "cargo-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cwnzi7cn5cs2rqz38v526q15q7sw1n5ai277bpix3f5jqyz6rpb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-crypto-hash" ,rust-crypto-hash-0.3)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-jobserver" ,rust-jobserver-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-same-file" ,rust-same-file-1)
        ("rust-shell-escape" ,rust-shell-escape-0.1)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-walkdir" ,rust-walkdir-2))))    
    (home-page "https://github.com/rust-lang/cargo")
    (synopsis "Miscellaneous support code used by Cargo.")
    (description " Miscellaneous support code used by Cargo. ")
    (license (list license:expat license:asl2.0))))

(define-public rust-cargo-platform-0.1
  (package
    (name "rust-cargo-platform")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargo-platform" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09zsf76b9yr02jh17xq925xp1w824w2bwvb78fd0gpx5m1fq5nyb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-lang/cargo")
    (synopsis "Target platform abstraction for Cargo")
    (description "This package provides abstractions for the target platforms
supported by Cargo.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cargo-0.65 
  (package
    (name "rust-cargo")
    (version "0.65.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19bwhm975360ys8ds3kyg6r5x1hzbi5f57hi3pclz560hamag2wq" ))))
    (build-system cargo-build-system)
    (arguments
     `(;; The test suite is disabled as the internal 'cargo-test-macro' and
       ;; 'cargo-test-support' crates are not included in the release.
       #:tests? #f
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-bytesize" ,rust-bytesize-1)
        ("rust-cargo-platform" ,rust-cargo-platform-0.1)
        ("rust-cargo-util" ,rust-cargo-util-0.2)
        ("rust-clap" ,rust-clap-3)
        ("rust-core-foundation" ,rust-core-foundation-0.9)
        ("rust-crates-io" ,rust-crates-io-0.34)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
        ("rust-crypto-hash" ,rust-crypto-hash-0.3)
        ("rust-curl" ,rust-curl-0.4)
        ("rust-curl-sys" ,rust-curl-sys-0.4)
        ("rust-env-logger" ,rust-env-logger-0.8)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-fwdansi" ,rust-fwdansi-1)
        ("rust-git2" ,rust-git2-0.14)
        ("rust-git2-curl" ,rust-git2-curl-0.15)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-home" ,rust-home-0.5)
        ("rust-humantime" ,rust-humantime-2)
        ("rust-ignore" ,rust-ignore-0.4)
        ("rust-im-rc" ,rust-im-rc-15)
        ("rust-jobserver" ,rust-jobserver-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-lazycell" ,rust-lazycell-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.13)
        ("rust-log" ,rust-log-0.4)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-opener" ,rust-opener-0.5)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-percent-encoding" ,rust-percent-encoding-2)
        ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rustc-workspace-hack" ,rust-rustc-workspace-hack-1)
        ("rust-rustfix" ,rust-rustfix-0.6)
        ("rust-same-file" ,rust-same-file-1)
        ("rust-semver" ,rust-semver-0.10)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-ignored" ,rust-serde-ignored-0.1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-shell-escape" ,rust-shell-escape-0.1)
        ("rust-strip-ansi-escapes" ,rust-strip-ansi-escapes-0.1)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-tempfile" ,rust-tempfile-3)
        ("rust-termcolor" ,rust-termcolor-1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-toml-edit" ,rust-toml-edit-0.14)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-unicode-xid" ,rust-unicode-xid-0.2)
        ("rust-url" ,rust-url-2)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-os-info" ,rust-os-info-3)
        ("rust-pathdiff" ,rust-pathdiff-0.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-snapbox" ,rust-snapbox-0.2))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list curl libssh2 libgit2 openssl zlib))
    (home-page "https://crates.io")
    (synopsis "Package manager for Rust")
    (description "Cargo, a package manager for Rust.  This package provides
the library crate of Cargo.")
    (license (list license:expat license:asl2.0))))

rust-cargo-0.65
