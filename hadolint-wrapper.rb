class HadolintWrapper < Formula
  include Language::Python::Virtualenv

  desc "Pretty output for hadolint"
  homepage "https://github.com/mperezi/hadolint-wrapper"
  url "https://github.com/mperezi/hadolint-wrapper/releases/download/v1.2/hadolintw-1.2.0-brew.tar.gz"
  sha256 "598d17cbb1109ad22a8d27b3c09722c02a193f8477eb9092043195db2052e856"

  depends_on "hadolint"
  depends_on "python"

  resource "click" do
    url "https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47/Click-7.0.tar.gz"
    sha256 "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
  end

  def install
    virtualenv_install_with_resources
  end
end
