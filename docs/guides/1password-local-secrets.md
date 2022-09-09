# Using 1Password to share local secrets

**Author's Note:** _All the plain-text secret values shown in this tutorial are fictional.  Don't try to use them to hack my things, because these resources do not exist._

[1Password](https://1password.com/) is an excellent password manager, and recently I began exploring the value it can provide for secrets management, and boy is it easy!  If your team is using 1Password, you can use your vaults to share secrets and pass them to your projects!  Below is a tutorial I've documented as I tested this process myself.

## Prerequisites
In order to follow this tutorial, you'll need:
* A [1Password cloud subscription](https://support.1password.com/explore/membership/).  If you're using the legacy version of 1Password where you self-host your vaults, this guide likely won't work.
* The 1Password CLI.  You can find the [installation docs here](https://developer.1password.com/docs/cli).

## Optional: Create a vault
While this step is _optional_ to complete the tutorial, it's a good practice to have your secrets and credentials organized in a way that segregates access.  For this example, let's pretend our project is the following:
* JavaScript based SaaS Application
* Engineering Team:
  * 1 Principal Engineer
  * 1 Senior-level Engineer
  * 1 Junior-level Engineer
* Two Environments
  * Non-Prod: Everyone has access
  * Production: Only Principal and Senior

Given this context, we'd want our Junior Engineer to be able to view/add/edit non-production secrets, but not production ones.  Let's start by first creating a vault which is accessible by all engineers and call it _NewApp Non-Prod_:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/cwjlf4te7hhdsu7ujdi8.png)

## Add secrets to vault
Next, let's populate a few different credentials in this vault.  For this tutorial, I'm going to keep things simple and create two different items.  For our first item, let's create _NewApp (Local)_.  This is where I would put shared secrets that are owned by the application itself.  In this example, I've defined a few items like `URL`, `admin password`, `postgres connection string`, `token salt`, and `JWT Secret`:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/n4mtqmf8ni5k3buoq2ve.png)

Next let's add a second item to our vault for a third-party integration.  For this example, we'll use the service [Twilio](https://www.twilio.com/) and define our test `Account SID` and `Auth Token` which is used by the application at startup:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ib195bdu0f1uws5d8pp5.png)

## Create a .env-template file
Within your project, create a new file called `.env-template`, which we'll use as a template for creating a `.env` file used by the application at runtime.  Let's scaffold our template by mapping out the environment variables our application requires:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/pk5ez6fa4mdsmdg94yl0.png)

## 1Password CLI
Now that we have our `.env-template` scaffolded, let's shift our focus towards the 1Password CLI.  First, start by [authenticating our CLI](https://developer.1password.com/docs/cli/get-started#sign-in) with the command `eval $(op signin)`.  The CLI will ask you to confirm which account you're authenticating with, and you'll be prompted to provide your password.

Once you've authenticated, you'll want to first start by [listing your Vaults](https://developer.1password.com/docs/cli/get-started#basic-commands).  To list your vaults, execute the command `op vault list`:
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/4wh67lq4z8gbu1qxd4yu.png)


Now that we have our vault details, let's list the items of our _NewApp Non-Prod_ vault.  To list items in a vault, you'll execute the command `op item list --vault <vault name or guid>`:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/vyh6jju83ddn6z4xxtt4.png)

Finally, we'll tell the CLI to fetch us the details of an item in JSON format, so we can copy the `reference` pointer to our template.  You can achieve this wit the command `op item get <item name or guid> --format json`

The reference pointers will be formatted as either
`op://<vault>/<item>/<property>` or `op://<vault>/<item>/<section>/<property>` depending how you stored the secret in your item.  The different paramaters can either be that property's _label/title/name_ or _guid_.

```
example-project % op item get 'NewApp (Local)' --format json
{
  "id": "bzbaer6g2smaqqpntup3zugy3y",
  "title": "NewApp (Local)",
  "version": 1,
  "vault": {
    "id": "54wvogqhltjzolqik3f4cajpru",
    "name": "NewApp Non-Prod"
  },
  "category": "SERVER",
  "last_edited_by": "LFQSVNLW5VCBFDW6QKJRODDWFY",
  "created_at": "2022-09-02T14:50:19Z",
  "updated_at": "2022-09-02T14:50:19Z",
  "sections": [
    {
      "id": "admin_console",
      "label": "Admin Console"
    },
    {
      "id": "n3n3xpw3j5e4e22a6c26kqbuaq",
      "label": "Secrets"
    }
  ],
  "fields": [
    {
      "id": "notesPlain",
      "type": "STRING",
      "purpose": "NOTES",
      "label": "notesPlain",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/notesPlain"
    },
    {
      "id": "url",
      "type": "STRING",
      "label": "URL",
      "value": "https://localhost:42069",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/URL"
    },
    {
      "id": "admin_console_url",
      "section": {
        "id": "admin_console",
        "label": "Admin Console"
      },
      "type": "STRING",
      "label": "admin console URL",
      "value": "https://localhost:42069/admin",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Admin Console/admin console URL"
    },
    {
      "id": "admin_console_username",
      "section": {
        "id": "admin_console",
        "label": "Admin Console"
      },
      "type": "STRING",
      "label": "admin console username",
      "value": "admin@newapp.dev",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Admin Console/admin console username"
    },
    {
      "id": "admin_console_password",
      "section": {
        "id": "admin_console",
        "label": "Admin Console"
      },
      "type": "CONCEALED",
      "label": "console password",
      "value": "eZMvXEcKTL9KWRjhyTrN",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Admin Console/console password"
    },
    {
      "id": "izfxzz7i5qbtj7unkkh6nfg3hu",
      "section": {
        "id": "n3n3xpw3j5e4e22a6c26kqbuaq",
        "label": "Secrets"
      },
      "type": "STRING",
      "label": "Postgres Connection String",
      "value": "postgres://postgres:123456@127.0.0.1:5432/dummy",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/Postgres Connection String"
    },
    {
      "id": "6ljbsngcsimhqg7x4iukfbaovm",
      "section": {
        "id": "n3n3xpw3j5e4e22a6c26kqbuaq",
        "label": "Secrets"
      },
      "type": "STRING",
      "label": "Token Salt",
      "value": "07af136084ca0ea0cc192b0769e97122",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/Token Salt"
    },
    {
      "id": "bvbjgzmdo4wwra7noxfnsvvyca",
      "section": {
        "id": "n3n3xpw3j5e4e22a6c26kqbuaq",
        "label": "Secrets"
      },
      "type": "STRING",
      "label": "JWT_Secret",
      "value": "061971eaaaa99212e737c1e789799cd8",
      "reference": "op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/JWT_Secret"
    }
  ]
}
```
## Add reference pointers
With the reference value copied, return to your `.env-template` file and paste the pointer as the environment variable value.  Repeat the process of fetching the reference values until your `.env-template` file is complete.  What mine looked like after I finished:

```
ADMIN_PASSWORD=op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Admin Console/console password
POSTGRES_CONNECTION_STRING=op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/Postgres Connection String
TOKEN_SALT=op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/Token Salt
JWT_SECRET=op://NewApp Non-Prod/bzbaer6g2smaqqpntup3zugy3y/Secrets/JWT_Secret
TWILIO_SID=op://NewApp Non-Prod/Twilio/Test Secrets/Account SID
TWILIO_AUTH_TOKEN=op://NewApp Non-Prod/Twilio/Test Secrets/Auth Token
```

## Inject your secret values
Now that we have our `.env-template` fully configured, we can run the command `op inject -i .env-template -o .env` which will create a `.env` file with the secret values.  In the screenshot I have below, you can compare the template against the output of the command:

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/q4n1dptxjh97qezxprii.png)

## Add Project Shortcut
Now that you have a process to easily generate your `.env`, let's make it easy for other team members to use by scripting the process.  Since we're working with a JavaScript project for this tutorial, let's add a script to our `package.json` file so developers only have to run `npm run env:generate` to create their own `.env` files locally:
```
{
  "name": "@mainwaring/example-project",
  "version": "2022.1.0",
  "description": "This is my example project!",
  "main": "index.js",
  "scripts": {
    "env:generate": "eval $(op signin) && op inject -i .env-template -o .env",
    "test": "jest"
  },
  "author": "Joe Mainwaring <joe@mainwaring.dev>",
  "license": "MIT"
}
```

You'll notice in this example, my script is `eval $(op signin) && op inject -i .env-template -o .env` and not just `op inject -i .env-template -o .env`.  By chaining the signin and iject commands, the developer will be be immediately presented with the `signin` workflow if they aren't already authenticated.  This would otherwise require the developer to run 2-3 additional steps on their own if their terminal session was unauthenticated.



