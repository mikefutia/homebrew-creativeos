class CreativeosConnector < Formula
  desc "Creative OS local connector for Claude Code"
  homepage "https://usecreativeos.com"
  url "https://github.com/mikefutia/homebrew-creativeos/releases/download/creativeos-connector-v0.1.0/creativeos-connector-0.1.0.zip"
  sha256 "d33d01db23ef47a797f6e51d5b6d4b9662e0f0970f05c1b604df60fa27ec5c8c"
  version "0.1.0"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    system "npm", "install", "--omit=dev", "--ignore-scripts", "--prefix", libexec

    (bin/"creativeos-connector").write <<~EOS
      #!/bin/bash
      cd "#{libexec}"
      exec "#{Formula["node"].opt_bin}/node" --import tsx "#{libexec}/scripts/creativeos-connector.mts" "$@"
    EOS
    chmod 0755, bin/"creativeos-connector"
  end

  service do
    run [opt_bin/"creativeos-connector", "run"]
    keep_alive true
    log_path var/"log/creativeos-connector.log"
    error_log_path var/"log/creativeos-connector.log"
  end

  def caveats
    <<~EOS
      Before starting the connector:
        1. Make sure Claude Code is installed and signed in.
        2. In Creative OS, open Settings > Claude Code and generate a setup code.
        3. Run: creativeos-connector pair
        4. Run: brew services start creativeos-connector
    EOS
  end

  test do
    system "#{bin}/creativeos-connector", "help"
  end
end
