name: Update Proxy Config
on:
  schedule:
    - cron: '0 */6 * * *'  # هر 6 ساعت یکبار اجرا شود
  workflow_dispatch:  # امکان اجرای دستی

jobs:
  update-config:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    
    - name: Fetch config
      run: |
        curl -s "https://raw.githubusercontent.com/hamedp-71/Xs_warp/refs/heads/main/warp" > index.html
        
    - name: Commit changes
      run: |
        git config --global user.name "GitHub Actions"
        git config --global user.email "actions@github.com"
        git add index.html
        git commit -m "Auto-update config" || echo "No changes to commit"
        git push
