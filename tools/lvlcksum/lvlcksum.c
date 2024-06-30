#include <stdint.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    FILE *f;
    uint32_t checksum = 0;
    size_t readCount;

    if (argc != 2)
    {
        printf("usage: %s FILENAME\n"
               "Computes a checksum for a level file\n",
               argv[0]);
        return 1;
    }

    f = fopen(argv[1], "r+");
    if (f == NULL)
    {
        fprintf(stderr, "Failed to open %s\n", argv[1]);
        return 1;
    }

    fseek(f, 4, SEEK_SET);  // skip over checksum

    // compute checksum
    do
    {
        uint8_t buf[2] = {0};

        readCount = fread(buf, 1, 2, f);
        if (readCount < 2 && !feof(f))
        {
            fprintf(stderr, "Error reading %s\n", argv[1]);
            fclose(f);
            return 1;
        }
        checksum += buf[0] | (buf[1] << 8);
    } while (readCount == 2);
    checksum++;

    // write checksum
    uint8_t buf[4];
    buf[0] = checksum & 0xFF;
    buf[1] = (checksum >> 8) & 0xFF;
    buf[2] = (checksum >> 16) & 0xFF;
    buf[3] = (checksum >> 24) & 0xFF;
    fseek(f, 0, SEEK_SET);
    if (fwrite(buf, 4, 1, f) != 1)
    {
        fprintf(stderr, "Error writing %s\n", argv[1]);
        fclose(f);
        return 1;
    }

    fclose(f);
    return 0;
}
