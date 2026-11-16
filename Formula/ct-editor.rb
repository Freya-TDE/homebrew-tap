class CtEditor < Formula
  desc "Visual editor for Cargo.toml files"
  homepage "https://github.com/Freya-TDE/CT-E"
  url "https://github.com/Freya-TDE/CT-E/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "43368ee7b7cdeffd246ef4a886a7f6650c04845119b7afbde4771de279544f74"
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
