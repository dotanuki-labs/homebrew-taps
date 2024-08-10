# Copyright 2024 Dotanuki Labs
# SPDX-License-Identifier: MIT

class GradleWiper < Formula
  desc "Easily reclaim machine resources (RAM, Disk) taken by Gradle builds"
  homepage "https://github.com/dotanuki-labs/gradle-wiper"
  version "0.2.0"

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
    when "x86_64-unknown-linux-gnu" then "344fb7b1493426094f232af0f97f99bf623ea88e5532da026bbd7f70c3e8ddd3"
    when "x86_64-apple-darwin" then "3ca994e699062fbcba836f7edfc0e41a8b8e794fbdc9b1ed1abf3763c5760f9d"
    when "aarch64-unknown-linux-gnu" then "54b5ebdbac149598b4087292ae66385239672e23226d46e4f319443295578870"
    when "aarch64-apple-darwin" then "d47b9a4222327746b489cefc5acb3bab6eaabe1f479da387dd59c4f0f82304e5"
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
