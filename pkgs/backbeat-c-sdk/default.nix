{
  rustPlatform,
  fetchFromGitHub,
  pkgs,
  lib,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "backbeat-c-sdk";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "zkldi";
    repo = "backbeat";
    rev = "5df6f7630e099e8693b6427c27d6c3e98576b8e0";
    hash = "sha256-/9l6SHjNEAAd/s0AIi9XdbcxrsozxbNkutZHFqdnpJs=";
  };

  cargoHash = "sha256-CrMFFor4Oa4A+2B2wCmwLP7L+Z5ObVfQR1tlVbHAr5U=";
  buildAndTestSubdir = "rust/backbeat_c_sdk"; # https://discourse.nixos.org/t/using-buildrustcrate-to-build-a-project-within-a-cargo-workspace/15672/8
  doCheck = false;

  # buildPhase = "return 0;";
  buildInputs = with pkgs; [
    openssl_3_6
    glib
    sqlite
  ];

  nativeBuildInputs = with pkgs; [
    rustPlatform.bindgenHook
    pkg-config
    clang
    lld
  ];
}
