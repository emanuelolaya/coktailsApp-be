const { formatUrl } = require('@aws-sdk/util-format-url')
const { parseUrl } = require('@aws-sdk/url-parser')
const { fromEnv } = require('@aws-sdk/credential-providers')
const { Hash } = require('@aws-sdk/hash-node')
const { S3RequestPresigner } = require('@aws-sdk/s3-request-presigner')
const { HttpRequest } = require('@aws-sdk/protocol-http')

const createPresignedUrlWithoutClient = async ({ region, bucket, key }) => {
  const url = parseUrl(`https://${bucket}.s3.${region}.amazonaws.com/${key}`)
  const presigner = new S3RequestPresigner({
    credentials: fromEnv({ profile: 'default', filepath: '../config/aws_credentials' }),
    region,
    sha256: Hash.bind(null, 'sha256')
  })

  const signedUrlObject = await presigner.presign(new HttpRequest(url))
  return formatUrl(signedUrlObject)
}

module.exports = {
  createPresignedUrlWithoutClient
}
