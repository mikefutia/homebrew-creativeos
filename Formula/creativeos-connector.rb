class CreativeosConnector < Formula
  desc "Creative OS local connector for Claude Code"
  homepage "https://usecreativeos.com"
  url "https://github.com/mikefutia/homebrew-creativeos/releases/download/creativeos-connector-v0.1.74/creativeos-connector-0.1.74.zip"
  sha256 "575219382a23e40a73cd13319e580e5ec5b2d68f8f7b9791c24b6741cdde6fd1"
  version "0.1.74"

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

  def post_install
    (var/"log").mkpath
  end

  service do
    run [opt_bin/"creativeos-connector", "run"]
    process_type :interactive
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
