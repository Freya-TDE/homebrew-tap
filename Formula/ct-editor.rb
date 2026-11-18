class CtEditor < Formula
  desc "Visual editor for Cargo.toml files"
  homepage "https://github.com/Freya-TDE/CT-E"
  url "https://github.com/Freya-TDE/CT-E/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "d556b96f05de77e58e03b69eb69f7f1de80794b8e08f20a6a2ed6cc0ab26fa25"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Freya-TDE/CT-E.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gtk4"
  depends_on "gtksourceview5"

  def install
    system "cargo", "install", *std_cargo_args
    # Symbol für die App, die der DS-Launcher unter Programme anlegt.
    (share/"ct-editor").install "assets/icons/ct-editor-256.png" => "icon.png"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ct-editor --version")
  end
end
