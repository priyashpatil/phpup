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

func TestRootCmdOutput(t *testing.T) {
	// Create a new command for testing to avoid side effects
	rootCmd := cmd.GetRootCmd() // Use a function to get the root command
	buf := new(bytes.Buffer)
	rootCmd.SetOut(buf)
	rootCmd.SetErr(buf)

	// Execute the command with the --help flag
	rootCmd.SetArgs([]string{"--help"})
	err := rootCmd.Execute()

	assert.NoError(t, err)
	output := buf.String()

	assert.Contains(t, output, "phpup - CLI tool to manage PHP environments 🚀")
	assert.Contains(t, output, "phpup 0.0.1 (build: dev)")
	assert.Contains(t, output, "Composer version unknown")
	assert.Contains(t, output, "PHP version unknown")
}
