class Kpass < Formula
  desc "Command-line password manager"
  homepage "https://github.com/pkge/kpass"
  url "https://github.com/pkge/kpass/archive/1.7.1.tar.gz"
  sha256 "bbbfa4a94b5f3050ebf8ca8c8054d4c16ecb86ce22523dd2d33e566cc08c1404"

  depends_on "pwgen"
  depends_on "tree"
  depends_on "jq"
  depends_on "gnu-getopt"
  depends_on :gpg

  def install
    system "make", "PREFIX=#{prefix}", "install"
    share.install "contrib"
    zsh_completion.install "src/completion/pass.zsh-completion" => "_pass"
    bash_completion.install "src/completion/pass.bash-completion" => "password-store"
    fish_completion.install "src/completion/pass.fish-completion" => "pass.fish"
  end

  test do
    system "#{bin}/pass", "--version"
  end
end
