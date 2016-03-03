class Pass < Formula
  desc "Command-line password manager"
  homepage "https://github.com/pkge/pass"
  url "https://github.com/pkge/pass/archive/1.7.4.tar.gz"
  sha256 "d752bec6063f3dc0e657bd85325929b5d957e0e972f23611aa614636532360e3"

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
