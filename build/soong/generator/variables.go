package generator

import (
	"fmt"

	"android/soong/android"
)

func prototypeExpandVariables(ctx android.ModuleContext, in string) string {
	prototypeVars := ctx.Config().VendorConfig("prototypeVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if prototypeVars.IsSet(name) {
			return prototypeVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
