class Gwv < Formula
  desc "A validator for gradle/wrapper jar binaries, intended to be used in CI pipelines"
  homepage "https://github.com/dotanuki-labs/gradle-wrapper-validator"
  version "0.2.0

  os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu "
  arch = case Hardware::CPU.arch
         when :x86_64 then "x86_64"
         when :arm64 then "aarch64"
         else
           raise "gorush: Unsupported system architecture #{Hardware::CPU.arch}"
         end

  @@filename = "gwv-#{arch}-#{os}"
  @@url = "#{homepage}/releases/download/#{version}/#{@@filename}"
  @@using = :nounzip

  @@sha256 = case "##{arch}-#{os}"
    when "x86_64-unknown-linux-gnu" then "ad4d81bd7f30a2a05e65313ec273139f24b260fb343f94abbdc02fdc4cd7585e"
    when "x86_64-apple-darwin" then "d975f93599b17829d6b016d54163db657be7899215869756501df38c513d86a8"
    when "aarch64-unknown-linux-gnu" then "1c0248acc279b5dbc4cf8776016dfc4d39f243902bc1544d59f06d91e9d93dc8"
    when "aarch64-apple-darwin" then "3ab1d6eef8e48fd3697f9f4cf535a106e46f7e530982ab324779bada3fca9921"
    else
      raise "gwv: Unsupported combination (arch / operating system) #{arch}-#{os}"
    end

  sha256 @@sha256
  url @@url,
    using: @@using


  def install
    filename = Gwv.class_variable_get("@@filename")
    bin.install filename => "gwv"
  end

  test do
    system "#{bin}/gwv", "--version"
  end
end
