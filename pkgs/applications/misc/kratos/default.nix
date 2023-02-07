{ fetchFromGitHub, buildGoModule, lib, stdenv }:

buildGoModule rec {
  pname = "kratos";
  version = "v0.11.1";
  sha256 = "0031830qvkpkdlkqap5xlxzmjh4wg7n4jd8c1crvjh331zpqvp9d";
  vendorSha256 = "sha256-3YI8uvXM7/3Kg7LuCjvECyqI8kLsrJzXgNmFUCR8Y60=";

  src = fetchFromGitHub {
    owner = "MrMebelMan"; # A fork that adds support for API-based OIDC flows
    repo = "kratos";
    rev = "3f5b41c235b88058894a95feaece072af750cfc7";
    hash = "sha256-4pxp8V0KYhVxXVINQItIQSkzmbJRHLocuC25W5lc19Y=";
  };

  subPackages = [ "." ];

  tags = [ "sqlite" ];

  doCheck = false;

  preBuild = ''
    # Patch shebangs
    files=(
       test/e2e/run.sh
       script/testenv.sh
       script/test-envs.sh
       script/debug-entrypoint.sh
    )
    patchShebangs "''${files[@]}"

    # patchShebangs doesn't work for this Makefile, do it manually
    substituteInPlace Makefile --replace '/bin/bash' '${stdenv.shell}'
  '';

  meta = with lib; {
    maintainers = with maintainers; [ mrmebelman ];
    homepage = "https://www.ory.sh/kratos/";
    license = licenses.asl20;
    description = "An API-first Identity and User Management system that is built according to cloud architecture best practices";
  };
}
