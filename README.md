# Crypto-Database

This script sets up a **crypto database** for a **cryptocurrency platform** that manages users, packages, rewards, and transactions.

**Main Tables**
**USERS:** Manages user info and referral system.
**PACKAGES:** Details of investment packages.
**USER_MEMBERSHIP:** Tracks user plans and ROI.
**WALLET:** User balances and incomes.
**TRANSACTIONS:** Logs all wallet transactions.
**REWARDS:** Details of rank-based rewards.
**LEVEL_INCOME:** Tracks level-based incomes.
**ROI_INCOME:** Logs returns on investments.

**Trigger**
**After Insert** on **USER_MEMBERSHIP:** Automatically updates **ROI_INCOME**.
