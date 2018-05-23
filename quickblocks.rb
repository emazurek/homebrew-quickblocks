# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Quickblocks < Formula
  desc "Intelligent caching of Ethereum data"
  homepage "https://github.com/Great-Hill-Corporation/quickBlocks"
  url "https://github.com/Great-Hill-Corporation/quickBlocks/archive/0.4.6-alpha.tar.gz"
  sha256 "d9ac91a0e25d35ba76b22c2dbc5c57b367f1f1687e3d3e5f6daf6c910672fef5"
  depends_on "cmake" => :build
  depends_on "curl"
  depends_on "python"

  def install
    ENV.deparallelize
    Dir.mkdir("./build")
    Dir.chdir("./build") do
      system "cmake", "../src", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test quickBlocks`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
