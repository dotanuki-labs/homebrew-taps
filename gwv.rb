# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

class Gwv < Formula
  desc "A validator for gradle/wrapper jar binaries, intended to be used in CI pipelines"
  homepage "https://github.com/dotanuki-labs/gradle-wrapper-validator"
  version "0.5.0"

  os = OS.mac? ? "apple-darwin" : "unknown-linux-musl"
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
    when "x86_64-unknown-linux-musl" then "c26be64591b642804f3ec1aac33b9e4d82866f088ec670c9d280559e52b79e39"
    when "aarch64-unknown-linux-musl" then "aed727b582b22712e5624880557ec307e8969d4dad243e8bcdf21df7dda9a88a"
    when "x86_64-apple-darwin" then "26195d6aa801adf70d9036af125acdac9e28ed7cee3dbca53aeb53c2811c891f"
    when "aarch64-apple-darwin" then "6208190e4fdb42fd2189988b26bd69fecd4386c5e8a659116809faa10e09a0a8"
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
