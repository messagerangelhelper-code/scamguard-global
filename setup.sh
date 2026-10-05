#!/usr/bin/env bash
# Arranges the flat files in the repo root into the app/ folder layout Vite expects.
# Runs at build time on Render, so the repo can stay flat (easy to replace files by name).
set -e
mkdir -p app/src/components app/src/pages app/src/services app/src/utils

mv_if() { [ -f "$1" ] && mv "$1" "$2"; return 0; }

for f in index.html package.json vite.config.js; do mv_if "$f" app/; done
for f in index.css main.jsx App.jsx ErrorBoundary.jsx; do mv_if "$f" app/src/; done
for f in AdminReset CharityCheck CryptoCheck Dashboard DecoyCard EvidencePanel FreezeCredit IC3Report InsuranceCheck LinkCheck PricingPlans ReportingPanel RiskResult ScamCheck SeniorMode TaxScamCheck USAFlagIcon VoiceInput; do
  mv_if "$f.jsx" app/src/components/
done
mv_if Subscriptions.jsx app/src/pages/
mv_if scamAnalysis.js app/src/services/
mv_if usageTracker.js app/src/utils/
echo "setup done"
