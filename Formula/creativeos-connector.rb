class CreativeosConnector < Formula
  desc "Creative OS local connector for Claude Code"
  homepage "https://usecreativeos.com"
  url "https://github.com/mikefutia/homebrew-creativeos/releases/download/creativeos-connector-v0.1.61/creativeos-connector-0.1.61.zip"
  sha256 "e46238051e02158dec74646e286617dbd8ba99d212c6391bf08dd9f45e07b80d"
  version "0.1.61"

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
        1. Make sure the Claude Code CLI is installed.
           Default: curl -fsSL https://claude.ai/install.sh | bash
        2. In Creative OS, open Settings > Claude Code and create a pairing command.
        3. Paste the full pairing command into Terminal.
        4. Run: creativeos-connector auth
        5. Finish Claude account sign-in if the authorization step opens it.
        6. Run: brew services restart creativeos-connector

      To connect provider accounts through Claude Code MCP:
        Open Creative OS > Settings > Connections, expand the provider, then click Add.
        Creative OS opens the provider sign-in and completes the local Claude Code callback.
    EOS
  end

  test do
    system "#{bin}/creativeos-connector", "help"
  end
end
