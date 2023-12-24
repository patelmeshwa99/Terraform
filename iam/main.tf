provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_user" "dummy-user" {
  name = "my-test-user"
}

resource "aws_iam_policy" "dummy-policy" {
  name   = "my-test-policy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": "s3:ListBucket",
			"Resource": "*"
		}
	]
}
  EOF
}

resource "aws_iam_policy_attachment" "my-test-policy-attachment" {
  name       = "test-policy-attachment"
  users      = [aws_iam_user.dummy-user.name]
  policy_arn = aws_iam_policy.dummy-policy.arn
}
