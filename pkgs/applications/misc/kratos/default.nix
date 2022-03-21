{ fetchgit, buildGoModule, lib, stdenv }:

buildGoModule rec {
  name = "kratos";

  src = fetchgit {
    url = "https://github.com/MrMebelMan/kratos";
    rev = "627f4a1ddb378db84510a85013c4580a9d8024ad";
    sha256 = "0q45cxw614b00ckm54r9y421hqqfx21yax8ir537n0f6p3bdjwmx";
  };

  vendorSha256 = "0rxkrrpm7fn9aqmgr9p7vyp94ppcr43k2jcghy4i2qy3pjkm2sm1";

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
