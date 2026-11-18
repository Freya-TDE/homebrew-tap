class DsLauncher < Formula
  desc "Installs and updates the programs of Dragon Software"
  homepage "https://catalog.dragon-software.net"
  url "https://github.com/Dragon-InterActive/DS-Catalog/releases/download/ds-launcher-v0.3.5/ds-launcher-0.3.5-macos-aarch64.tar.gz"
  version "0.3.5"
  sha256 "e2503fece8b15a5d9ec755ed06cd25729c0eee75385fddbc80cab2366ac6d8f7"
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
