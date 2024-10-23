# Comparison between ossec.conf and agent.conf capabilities (group-based centralized configuration)

| **Configuration sections**         | **Supported installations**  | **agent.conf**                                               |
| ---------------------------------- | ---------------------------- | ------------------------------------------------------------ |
| active-response                    | manager, agent                |                                                              |
| agentless                          | manager                       |                                                              |
| agent-upgrade                      | manager, agent                |                                                              |
| alerts                             | manager                       |                                                              |
| auth                               | manager                       |                                                              |
| client                             | agent                         | force_reconnect_interval setting (client)                    |
| client_buffer                      | agent                         | Avoid events flooding (client_buffer)                        |
| cluster                            | manager                       |                                                              |
| command                            | manager                       |                                                              |
| database_output                    | manager                       |                                                              |
| email_alerts                       | manager                       |                                                              |
| fluent-forward                     | manager, agent                |                                                              |
| global                             | manager                       |                                                              |
| github                             | manager, agent                |                                                              |
| indexer                            | manager                       |                                                              |
| integration                        | manager                       |                                                              |
| labels                             | manager, agent                | Labels for agent alerts (labels)                             |
| localfile                          | manager, agent                | Log data collection (localfile)                              |
| logging                            | manager, agent                |                                                              |
| ms-graph                           | manager, agent                |                                                              |
| office365                          | manager, agent                |                                                              |
| remote                             | manager                       |                                                              |
| reports                            | manager                       |                                                              |
| rootcheck                          | manager, agent                | Rootkit detection (rootcheck)                                |
| rule_test                          | manager                       |                                                              |
| ruleset                            | manager                       |                                                              |
| sca                                | manager, agent                | Security Configuration Assessment (sca)                      |
| socket                             | manager, agent                |                                                              |
| syscheck                           | manager, agent                | File Integrity monitoring (syscheck)                         |
| syslog_output                      | manager                       |                                                              |
| task-manager                       | manager                       |                                                              |
| vulnerability-detection            | manager                       |                                                              |
| wazuh_db                           | manager                       |                                                              |
| wodle name="agent-key-polling"     | manager                       |                                                              |
| wodle name="aws-s3"                | manager, agent                |                                                              |
| wodle name="azure-logs"            | manager, agent                |                                                              |
| wodle name="cis-cat"               | manager, agent                | Security policy monitoring (wodle name="open-scap", wodle name="cis-cat") |
| wodle name="command"               | manager, agent                | Remote commands (wodle name="command")                       |
| wodle name="docker-listener"       | manager, agent                |                                                              |
| wodle name="open-scap"             | manager, agent                | Security policy monitoring (wodle name="open-scap", wodle name="cis-cat") |
| wodle name="osquery"               | manager, agent                | Configure osquery wodle (wodle name="osquery")               |
| wodle name="syscollector"          | manager, agent                | System inventory (syscollector)                              |
| gcp-pubsub                         | manager, agent                |                                                              |
| gcp-bucket                         | manager, agent                |                                                              |

---

This table compares the configuration components between `ossec.conf` and `agent.conf`, indicating which installations they are available for and what additional functionalities are available in `agent.conf`.
