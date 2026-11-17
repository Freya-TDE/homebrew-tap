class CtEditor < Formula
  desc "Visual editor for Cargo.toml files"
  homepage "https://github.com/Freya-TDE/CT-E"
  url "https://github.com/Freya-TDE/CT-E/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "07a87e4693be51d914c421b657f2b33aa281f39e993c8f17e8eb52da1ceeb5f4"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Freya-TDE/CT-E.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gtk4"
  depends_on "gtksourceview5"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ct-editor --version")
  end
end
