class FreyaTde < Formula
  desc "Visual development environment for Rust (RAD, Delphi/Lazarus style)"
  homepage "https://github.com/Freya-TDE/Freya-TDE"
  url "https://github.com/Freya-TDE/Freya-TDE/releases/download/v0.1.0/freya-tde-0.1.0-macos-aarch64.tar.gz"
  sha256 "cd143d8b5f2fae9609651dfabf0c9c1f320d008b00c7f45edb48ae7ae87956ea"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "adwaita-icon-theme"
  depends_on arch: :arm64
  depends_on "git"
  depends_on "gtk4"
  depends_on "gtksourceview5"

  def install
    bin.install "bin/freya-tde", "bin/freya-tde-db", "bin/ct-editor"
    (share/"freya-tde").install "share/freya-tde/components", "share/freya-tde/widgets"
    doc.install Dir["share/doc/freya-tde/*"]
  end

  def caveats
    <<~EOS
      Freya TDE braucht eine Rust-Toolchain (rustup.rs oder `brew install rustup`)
      sowie rust-analyzer, clippy und rustfmt. Der DS-Launcher prüft das und hilft.
    EOS
  end

  test do
    assert_predicate bin/"freya-tde", :executable?
  end
end
