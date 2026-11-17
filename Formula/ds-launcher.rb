class DsLauncher < Formula
  desc "Installs and updates the programs of Dragon Software"
  homepage "https://catalog.dragon-software.net"
  url "https://github.com/Dragon-InterActive/DS-Catalog/releases/download/ds-launcher-v0.2.0/ds-launcher-0.2.0-macos-aarch64.tar.gz"
  version "0.2.0"
  sha256 "05a39fb57da7c29c575044c561d2d6b59b2ccd182ef05e8111a19fea6b42f2c8"
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
