class FreyaTde < Formula
  desc "Visual development environment for Rust (RAD, Delphi/Lazarus style)"
  homepage "https://github.com/Freya-TDE/Freya-TDE"
  url "https://github.com/Freya-TDE/Freya-TDE/releases/download/v0.1.5/freya-tde-0.1.5-macos-aarch64.tar.gz"
  sha256 "d2c04204fc5ac14a6e606efd8a8ffae7c2fde21e68b579a2bc0767c0e570bdca"
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
    (share/"freya-tde").install "share/freya-tde/components", "share/freya-tde/widgets",
                                "share/freya-tde/icon.png"
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
