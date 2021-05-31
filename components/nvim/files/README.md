# Vim Workflow

## File Navigation

> All fuzzy file buffers open in floating window
`ff` - Open fuzzy file finder
`fa` - Open FZF text search
`fb` - Open FZF buffer search

## Git
### Status
`gs` - Open fugitive git status window
`dd` or `dv` - Open diff for changed file

### Staging Changes
After running `dd` or `dv` from a status buffer, the **working** copy will be on the right, and the **index** copy will be on the left.

`do` or `:diffget` to pull a hunk from one buffer into the other.
`dp` or `:diffput` to put a hunk from one buffer into the other.

You can also use visual blocks instead of staging/resetting an entire hunk.

The **index** copy will need to be saved for the changes to be applied.

