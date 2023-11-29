# Photo Organizer

Mike, an avid traveler and photographer, has a collection of photos saved on his computer. However, the organization of these photos has become chaotic. To help him reorganize, a Ruby script named `photo_organizer.rb` has been created.

## Usage

1. **Input Format:**

   - The input to the script should be a string representing the list of photos.
   - Each line of the input string should follow the format: `<photoname>.<extension>, <city_name>, yyyy-mm-dd hh:mm:ss`.

2. **Running the Script:**

   - The script can be executed by running the command:
     ```bash
     ruby photo_organizer.rb
     ```
   - Ensure that the Ruby environment is set up on your machine.

3. **Changing Input:**

   - To modify the input photos, update the `input_string` variable in the script.
   - Add or remove lines according to your photo collection.

4. **Output:**
   - The script will output a string representing the list of new names for the photos.
   - Each new name is formed by combining the city name, a sequentially assigned number, and the original extension.
   - The order of photos in the output corresponds to their order in the input string.
