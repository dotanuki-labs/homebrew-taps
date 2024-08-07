# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

class Gwv < Formula
  desc "A validator for gradle/wrapper jar binaries, intended to be used in CI pipelines"
  homepage "https://github.com/dotanuki-labs/gradle-wrapper-validator"
  version "0.3.0"

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
    when "x86_64-unknown-linux-gnu" then "398c04f2fa3f92012246e1ee7952bd185a40c9e7df11ca72b97e099905f211e9"
    when "aarch64-unknown-linux-gnu" then "6564fb33ccac01e793c6bf50a3ea6a1c100e482766577a8b3b219a004926f233"
    when "x86_64-apple-darwin" then "41be9f5e890025d8eb4d71385f43b8170902aa6e099a6315c296fec1c50d6cc1"
    when "aarch64-apple-darwin" then "ad21188f434ae1778ffff2d812389465295dc38528b48574c91680c8a1355325"
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
