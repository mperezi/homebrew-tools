class HadolintWrapper < Formula
  include Language::Python::Virtualenv

  desc "Pretty output for hadolint"
  homepage "https://github.com/mperezi/hadolint-wrapper"
  url "https://github.com/mperezi/hadolint-wrapper/releases/download/v1.2.1/hadolintw-1.2.1-brew.tar.gz"
  sha256 "62ade57dea14d815ce87f99d65aaa19df7df1bd8d01c0d0b39e43c3b8c0167f0"

  bottle do
    root_url "https://dl.bintray.com/mperezi/bottles-tools"
    cellar :any_skip_relocation
    sha256 "c13d023ac12c745d630fc95f87c9c25a48374bbc2a4384d3d9b3aeaeda6a7eaa" => :catalina
    sha256 "dd28e21488b2b9995f1e86250f562c67bc29f24044603834f3ca1b09332cdfe8" => :high_sierra
  end

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
