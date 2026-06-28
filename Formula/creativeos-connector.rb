class CreativeosConnector < Formula
  desc "Creative OS local connector for Claude Code"
  homepage "https://usecreativeos.com"
  url "https://github.com/mikefutia/homebrew-creativeos/releases/download/creativeos-connector-v0.1.8/creativeos-connector-0.1.8.zip"
  sha256 "d02293cadca1fe61346a777d02a870140291053417f36960718b6412d790be12"
  version "0.1.8"
  revision 1

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
        4. Run: claude setup-token
        5. Run: creativeos-connector auth
        6. Run: brew services restart creativeos-connector

      If Terminal says claude is not found:
        ~/.claude/local/claude setup-token

      To connect provider accounts through Claude Code MCP:
        creativeos-connector meta-auth
        creativeos-connector higgsfield-auth
        creativeos-connector heygen-auth
    EOS
  end

  test do
    system "#{bin}/creativeos-connector", "help"
  end
end
