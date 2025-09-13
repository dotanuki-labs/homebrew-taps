# Copyright 2025 Dotanuki Labs
# SPDX-License-Identifier: MIT

class Canopus < Formula
  desc "A fast and pragmatic validator for Github Codeowners "
  homepage "https://github.com/dotanuki-labs/canopus"
  version "0.1.0"

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
    when "x86_64-unknown-linux-musl" then "390283f35d880d5d10f193f3915ace91eecd9cbda8dfbd01ef1e9e17819bc685"
    when "aarch64-unknown-linux-musl" then "5b6d5595a3e7106477b6343c7c682cf2a8af51978492abee6901228ea5ed8485"
    when "x86_64-apple-darwin" then "2956b1ae45a6de55f5054c4b2a9094d023d79a5a46268347ca4b9716cfceadc3"
    when "aarch64-apple-darwin" then "f2835d81a3801d35fb5625297c2c759953e61beca2f47ae47a91f01e127af2bd"
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
