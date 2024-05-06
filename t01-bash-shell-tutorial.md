# bash 


## echo
- Printing without Newline
```bash
echo -n "Hello, "
echo "world!"
```
```css
Hello, world!
```
## Printing Escape Characters Literally
- I can achieve this using the -e option. For example:
```bash
echo -e "This is a tab\tand this is a newline\n"
```
```kotlin
This is a tab   and this is a newline
```
echo -e "\n\nKubernetes installed successfully"