Hackjack is a professional bash script that generates extensive password lists (10,000+ variations) based on personal information such as name, date of birth, and pet names. Designed for security professionals, penetration testers, and ethical hackers, this tool helps create comprehensive password dictionaries for security testing purposes.

## Features

- 🎨 Professional interface with color-coded output
- 🔣 Generates 10,000+ password variations
- 🔠 Multiple pattern combinations (name, DOB, pet names)
- #️⃣ Leet speak transformations (a->4, e->3, etc.)
- ✨ Special character variations (!, @, #, etc.)
- 🔢 Number suffix variations (0-9)
- 🧹 Automatic duplicate removal
- 📁 Custom output file naming
- ⚠️ Ethical use reminders

## Installation

```bash
# Download the script
git clone https://github.com/neerajng123/Hackjack.git

# Make it executable
chmod +x create.sh
```

## Usage

```bash
./create.sh
```

Follow the interactive prompts to enter:
1. First name
2. Last name
3. Date of birth (year, month, day)
4. Pet name or favorite animal
5. Output filename (default: passwords.txt)

## Example Output

```
_   _            _     _           _    
| | | | __ _  ___| |__ (_) ___  ___| | __
| |_| |/ _` |/ __|  _ \| |/ _ \/ __| |/ /
|  _  | (_| | (__| | | | |  __/ (__|   < 
|_| |_|\__,_|\___|_| |_|_|\___|\___|_|\_\

Password Generator Pro v1.0
----------------------------------------

Please provide the following information:
First Name: John
Last Name: Smith
Birth Year (YYYY): 1985
Birth Month (MM): 07
Birth Day (DD): 15
Pet Name (or favorite animal): Max
Output filename (default: passwords.txt): john_smith_passwords.txt

[+] Generating passwords...
[*] Creating password variations...
[*] Creating leet speak variations...
[*] Removing duplicates...
[+] Successfully generated 12,483 passwords in john_smith_passwords.txt

Password generation complete!
Remember to use these passwords responsibly and ethically.
```

## Password Patterns Generated

The tool creates variations including:
- Name combinations (JohnSmith, SmithJohn)
- Date combinations (John1985, Smith0715)
- Leet speak (J0hnSm1th, Sm1thJ0hn)
- Special characters (JohnSmith!, John1985@)
- Number suffixes (JohnSmith123, Smith198500)
- Mixed case (johnSMITH, JOHNsmith)

## Ethical Considerations

⚠️ **Important:** This tool is intended for:
- Security professionals conducting authorized penetration tests
- System administrators testing their own systems
- Educational purposes in ethical hacking courses

Never use this tool for unauthorized access to any system or account.

## License

MIT License - Free for ethical and legal use

## Author

HackJack Security Tools

## Version

1.0v
