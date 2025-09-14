# Copyright 2025 Dotanuki Labs
# SPDX-License-Identifier: MIT

class Canopus < Formula
  desc "A fast and pragmatic validator for Github Codeowners "
  homepage "https://github.com/dotanuki-labs/canopus"
  version "0.1.1"

  os = OS.mac? ? "apple-darwin" : "unknown-linux-musl"
  arch = case Hardware::CPU.arch
         when :x86_64 then "x86_64"
         when :arm64 then "aarch64"
         else
           raise "canopus: Unsupported system architecture #{Hardware::CPU.arch}"
         end

  @@filename = "canopus-#{arch}-#{os}"
  @@url = "#{homepage}/releases/download/#{version}/#{@@filename}"
  @@using = :nounzip

  @@sha256 = case "#{arch}-#{os}"
    when "x86_64-unknown-linux-musl" then "1ed408ca934899e87f23b5ec15be3bd5c0024a91adf93740e891e30443dd410b"
    when "aarch64-unknown-linux-musl" then "3c78ecf346cb9548429282e10be7d0b2fedaf81604ec0ceff1c868308c7d6a7b"
    when "x86_64-apple-darwin" then "b5575904a9b3c4e9e682da479e58fb189824bdb0917f7453a4953abb951e9033"
    when "aarch64-apple-darwin" then "6468b55c45593c8c7ff9d3e73331d0acf658bf4de52d697d821fcb31aa1b7811"
    else
      raise "canopus: Unsupported combination (arch / operating system) #{arch}-#{os}"
    end

  sha256 @@sha256
  url @@url,
    using: @@using


  def install
    filename = @@filename
    bin.install filename => "canopus"
  end

  test do
    system "#{bin}/canopus", "--version"
  end
end
