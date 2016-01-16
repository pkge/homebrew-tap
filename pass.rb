class Pass < Formula
  desc "Command-line password manager"
  homepage "https://github.com/pkge/pass"
  url "https://github.com/pkge/pass/archive/1.7.1.tar.gz"
  sha256 "f2148442d84cdb7a92d3796150da625736a990e624ebefd972e0dfd452368d18"

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
