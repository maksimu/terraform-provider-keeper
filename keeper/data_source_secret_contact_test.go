package keeper

import (
	"fmt"
	"testing"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/resource"
)

func TestAccDataSourceSecretContact(t *testing.T) {
	secretType := "contact"
	secretUid, secretTitle := testAcc.getRecordInfo(secretType)
	if secretUid == "" || secretTitle == "" {
		t.Fatal("Failed to access test data - missing secret UID and/or Title")
	}

	config := fmt.Sprintf(`
		provider "keeper" {
			credential = "%v"
		}

		data "keeper_secret_contact" "%v" {
			path = "%v"
			title = "%v"
		}
	`, testAcc.credential, secretTitle, secretUid, secretTitle)

	resource.Test(t, resource.TestCase{
		Providers: testAccProviders,
		PreCheck:  testAccPreCheck(t),
		Steps: []resource.TestStep{
			{
				Config: config,
				Check: resource.ComposeTestCheckFunc(
					resource.TestCheckResourceAttr(
						fmt.Sprintf("data.keeper_secret_contact.%v", secretTitle),
						"type",
						secretType,
					),
					resource.TestCheckResourceAttr(
						fmt.Sprintf("data.keeper_secret_contact.%v", secretTitle),
						"title",
						secretTitle,
					),
					resource.TestCheckResourceAttr(
						fmt.Sprintf("data.keeper_secret_contact.%v", secretTitle),
						"notes",
						secretTitle,
					),
				),
			},
		},
	})
}
