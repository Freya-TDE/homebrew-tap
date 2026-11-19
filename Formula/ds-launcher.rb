class DsLauncher < Formula
  desc "Installs and updates the programs of Dragon Software"
  homepage "https://catalog.dragon-software.net"
  url "https://github.com/Dragon-InterActive/DS-Catalog/releases/download/ds-launcher-v0.3.6/ds-launcher-0.3.6-macos-aarch64.tar.gz"
  version "0.3.6"
  sha256 "5a306ddce266c38ad9432ed12d282f0317bc4ab7e218c821fc5fbe680920eae9"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64

  def install
    bin.install "bin/ds-launcher"
    doc.install Dir["share/doc/ds-launcher/*"]
  end

  service do
    run [opt_bin/"ds-launcher", "--tray"]
    keep_alive false
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-launcher --version")
  end
end
