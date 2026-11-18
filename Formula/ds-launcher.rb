class DsLauncher < Formula
  desc "Installs and updates the programs of Dragon Software"
  homepage "https://catalog.dragon-software.net"
  url "https://github.com/Dragon-InterActive/DS-Catalog/releases/download/ds-launcher-v0.3.3/ds-launcher-0.3.3-macos-aarch64.tar.gz"
  version "0.3.3"
  sha256 "74a803b3ac236d4a9d86e6b93e4fc96f8c28f4b4692120fa39ff0cc4f1604c78"
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
