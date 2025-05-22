# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

class Gwv < Formula
  desc "A validator for gradle/wrapper jar binaries, intended to be used in CI pipelines"
  homepage "https://github.com/dotanuki-labs/gradle-wrapper-validator"
  version "0.4.0"

  os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"
  arch = case Hardware::CPU.arch
         when :x86_64 then "x86_64"
         when :arm64 then "aarch64"
         else
           raise "gwv: Unsupported system architecture #{Hardware::CPU.arch}"
         end

  @@filename = "gwv-#{arch}-#{os}"
  @@url = "#{homepage}/releases/download/#{version}/#{@@filename}"
  @@using = :nounzip

  @@sha256 = case "#{arch}-#{os}"
    when "x86_64-unknown-linux-gnu" then "6b97d329c76e9f288a51ab490739c63520b6b581c69f216db443e8f39011784c"
    when "aarch64-unknown-linux-gnu" then "9e115c1b70680b58cc8db30172184f9019f5a42b5d800c5ed60e3e8b8597c44b"
    when "x86_64-apple-darwin" then "c46422dcafc35b6d15b7d84362b203653243fe6ebf8b46daf99beee7058dc9ce"
    when "aarch64-apple-darwin" then "0bc35c5920cf55b26a56285a2e46035838dc82cae1371fe469790aa5270b6d2e"
    else
      raise "gwv: Unsupported combination (arch / operating system) #{arch}-#{os}"
    end

  sha256 @@sha256
  url @@url,
    using: @@using


  def install
    filename = @@filename
    bin.install filename => "gwv"
  end

  test do
    system "#{bin}/gwv", "--version"
  end
end
