class FreyaTde < Formula
  desc "Visual development environment for Rust (RAD, Delphi/Lazarus style)"
  homepage "https://github.com/Freya-TDE/Freya-TDE"
  url "https://github.com/Freya-TDE/Freya-TDE/releases/download/v0.1.1/freya-tde-0.1.1-macos-aarch64.tar.gz"
  sha256 "b27d6d8bd96fbe548415ff69ba723f1a546a13eab16ded129f6e3c895954af7e"
  license any_of: ["MIT", "Apache-2.0"]

  # brew style sortiert alphabetisch, „arch“ zählt als Name.
  depends_on "adwaita-icon-theme"
  depends_on arch: :arm64
  depends_on "freya-tde/tap/ct-editor"
  depends_on "git"
  depends_on "gtk4"
  depends_on "gtksourceview5"

  def install
    bin.install "bin/freya-tde", "bin/freya-tde-db"
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
