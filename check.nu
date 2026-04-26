#!/usr/bin/env nu

def main [] {
  ^nu (path self . | path join "scripts" "check.nu")
}

main
