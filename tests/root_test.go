package cmd

import (
	"bytes"
	"io"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/priyashpatil/phpup/cmd"
)

func TestExecute(t *testing.T) {
	t.Run("Execute runs without error", func(t *testing.T) {
		// Redirect stdout to capture output
		old := os.Stdout
		r, w, _ := os.Pipe()
		os.Stdout = w

		cmd.Execute()

		// Restore stdout
		w.Close()
		os.Stdout = old

		var buf bytes.Buffer
		io.Copy(&buf, r)
		output := buf.String()

		// Change this assertion to check for the absence of error messages
		assert.NotContains(t, output, "Error:")
	})
}
