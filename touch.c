#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

/*
 * touch: A basic implementation of the 'touch' utility.
 *
 * This program creates a new, empty file if it doesn't exist.
 * If the file already exists, it simply opens and closes it, which
 * may update the access time on some systems.
 *
 * Usage:
 * ./touch <filename>
 *
 * The program expects exactly one command-line argument: the name of the file.
 */
int main(int argc, char *argv[]) {
    // 1. Check for correct number of arguments.
    // The program name is argv[0], so we expect at most two more arguments - the optional '-c' argument and the filename.
    // The '-c' argument makes it so the file is not created if it does not exist.
    if (argc < 2 || argc > 3) {
        fprintf(stderr, "Usage: %s [-c] <filename>\n", argv[0]);
        return 1; // Return an error code.
    }
    // Checking if the argument is valid
    if (argc == 3 && !(argv[1][0] == '-' && argv[1][1] == 'c')) {
        fprintf(stderr, "Usage: %s [-c] <filename>\n", argv[0]);
        return 1; // Return an error code.
    }

    char *filepath;
    if (argc == 2) filepath = argv[1];
    else filepath = argv[2];
    int fd; // File descriptor

    // 2. Try to open the file.
    // O_CREAT: If the file does not exist, it will be created.
    // O_WRONLY: Open for writing only.
    // O_APPEND: The file is opened in append mode.
    // 0644 are the file permissions for the new file (read/write for owner, read for others).
    if (argc == 3) fd = open(filepath, O_WRONLY | O_APPEND, 0644);
    else fd = open(filepath, O_WRONLY | O_CREAT | O_APPEND, 0644);

    // 3. Check if the file opening was successful.
    if (fd == -1) {
        perror("Error opening file"); // perror prints the error message from the system.
        return 1;
    }

    // 4. Close the file descriptor as we are done with it.
    if (close(fd) == -1) {
        perror("Error closing file");
        return 1;
    }

    // 5. If everything was successful, print a success message.
    printf("Successfully touched '%s'\n", filepath);

    return 0; // Success!
}

