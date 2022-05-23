# This file has been generated by node2nix 1.9.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "purs-tidy-0.9.0" = {
      name = "purs-tidy";
      packageName = "purs-tidy";
      version = "0.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/purs-tidy/-/purs-tidy-0.9.0.tgz";
        sha512 = "7la7Jw5CyuMDXJMliGiK746xevUScDCTJ0eMvN/mV/NAQF2c9Cqa31QNx5O15ae2d7SuFDqEiVALFzHYD601Cg==";
      };
    };
  };
  args = {
    name = "purs-tidy";
    packageName = "purs-tidy";
    version = "0.9.0";
    src = ./.;
    dependencies = [
      sources."purs-tidy-0.9.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
  nodeDependencies = nodeEnv.buildNodeDependencies (lib.overrideExisting args {
    src = stdenv.mkDerivation {
      name = args.name + "-package-json";
      src = nix-gitignore.gitignoreSourcePure [
        "*"
        "!package.json"
        "!package-lock.json"
      ] args.src;
      dontBuild = true;
      installPhase = "mkdir -p $out; cp -r ./* $out;";
    };
  });
}
