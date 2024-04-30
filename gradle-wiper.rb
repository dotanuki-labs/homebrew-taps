# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

class GradleWiper < Formula
  desc "Easily reclaim machine resources (RAM, Disk) taken by Gradle builds"
  homepage "https://github.com/dotanuki-labs/gradle-wiper"
  version "0.1.0"

  os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"
  arch = case Hardware::CPU.arch
         when :x86_64 then "x86_64"
         when :arm64 then "aarch64"
         else
           raise "gradle-wiper: Unsupported system architecture #{Hardware::CPU.arch}"
         end

  @@filename = "gradle-wiper-#{arch}-#{os}"
  @@url = "#{homepage}/releases/download/#{version}/#{@@filename}"
  @@using = :nounzip

  @@sha256 = case "#{arch}-#{os}"
    when "x86_64-unknown-linux-gnu" then "66cdb629934e4b114520685260ce7074f75702f9a92de820b0a5da0fd1678d00"
    when "x86_64-apple-darwin" then "307e40c054502b656d568b306a397c6ae79f57ecc7cf0a559effab3f36624a02"
    when "aarch64-unknown-linux-gnu" then "10c51bbb0613bfc45bb7a9f0e56500031a166e432e9f8449dc1f2f0af45a7adb"
    when "aarch64-apple-darwin" then "72aecebcd5fe423d6de2f59c0e73102e31d14f0b765beb2bac94e5f830c382c4"
    else
      raise "gradle-wiper: Unsupported target : #{arch}-#{os}"
    end

  sha256 @@sha256
  url @@url,
    using: @@using


  def install
    filename = @@filename
    bin.install filename => "gradle-wiper"
  end

  test do
    system "#{bin}/gradle-wiper", "--version"
  end
end
