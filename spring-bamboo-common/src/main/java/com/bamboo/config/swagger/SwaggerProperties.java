package com.bamboo.config.swagger;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author: acumes
 * @create: 2019-11-04 21:29:56
 * @description:
 */
@ConfigurationProperties("swagger")
public class SwaggerProperties {
    private List<String> basePackages = new ArrayList(Collections.singletonList("com.bamboo"));
    private List<String> basePath = new ArrayList();
    private List<String> excludePath = new ArrayList();
    private String title = "SpringBamboo 接口文档系统";
    private String description = "SpringBamboo 接口文档系统";
    private String version = "1.0.0";
    private String license = "";
    private String licenseUrl = "";
    private String termsOfServiceUrl = "";
    private String host = "";
    private SwaggerProperties.Contact contact = new SwaggerProperties.Contact();
    private SwaggerProperties.Authorization authorization = new SwaggerProperties.Authorization();

    public SwaggerProperties() {
    }

    public List<String> getBasePackages() {
        return this.basePackages;
    }

    public List<String> getBasePath() {
        return this.basePath;
    }

    public List<String> getExcludePath() {
        return this.excludePath;
    }

    public String getTitle() {
        return this.title;
    }

    public String getDescription() {
        return this.description;
    }

    public String getVersion() {
        return this.version;
    }

    public String getLicense() {
        return this.license;
    }

    public String getLicenseUrl() {
        return this.licenseUrl;
    }

    public String getTermsOfServiceUrl() {
        return this.termsOfServiceUrl;
    }

    public String getHost() {
        return this.host;
    }

    public SwaggerProperties.Contact getContact() {
        return this.contact;
    }

    public SwaggerProperties.Authorization getAuthorization() {
        return this.authorization;
    }

    public void setBasePackages(final List<String> basePackages) {
        this.basePackages = basePackages;
    }

    public void setBasePath(final List<String> basePath) {
        this.basePath = basePath;
    }

    public void setExcludePath(final List<String> excludePath) {
        this.excludePath = excludePath;
    }

    public void setTitle(final String title) {
        this.title = title;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public void setVersion(final String version) {
        this.version = version;
    }

    public void setLicense(final String license) {
        this.license = license;
    }

    public void setLicenseUrl(final String licenseUrl) {
        this.licenseUrl = licenseUrl;
    }

    public void setTermsOfServiceUrl(final String termsOfServiceUrl) {
        this.termsOfServiceUrl = termsOfServiceUrl;
    }

    public void setHost(final String host) {
        this.host = host;
    }

    public void setContact(final SwaggerProperties.Contact contact) {
        this.contact = contact;
    }

    public void setAuthorization(final SwaggerProperties.Authorization authorization) {
        this.authorization = authorization;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof SwaggerProperties)) {
            return false;
        } else {
            SwaggerProperties other = (SwaggerProperties)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label155: {
                    Object this$basePackages = this.getBasePackages();
                    Object other$basePackages = other.getBasePackages();
                    if (this$basePackages == null) {
                        if (other$basePackages == null) {
                            break label155;
                        }
                    } else if (this$basePackages.equals(other$basePackages)) {
                        break label155;
                    }

                    return false;
                }

                Object this$basePath = this.getBasePath();
                Object other$basePath = other.getBasePath();
                if (this$basePath == null) {
                    if (other$basePath != null) {
                        return false;
                    }
                } else if (!this$basePath.equals(other$basePath)) {
                    return false;
                }

                Object this$excludePath = this.getExcludePath();
                Object other$excludePath = other.getExcludePath();
                if (this$excludePath == null) {
                    if (other$excludePath != null) {
                        return false;
                    }
                } else if (!this$excludePath.equals(other$excludePath)) {
                    return false;
                }

                label134: {
                    Object this$title = this.getTitle();
                    Object other$title = other.getTitle();
                    if (this$title == null) {
                        if (other$title == null) {
                            break label134;
                        }
                    } else if (this$title.equals(other$title)) {
                        break label134;
                    }

                    return false;
                }

                label127: {
                    Object this$description = this.getDescription();
                    Object other$description = other.getDescription();
                    if (this$description == null) {
                        if (other$description == null) {
                            break label127;
                        }
                    } else if (this$description.equals(other$description)) {
                        break label127;
                    }

                    return false;
                }

                label120: {
                    Object this$version = this.getVersion();
                    Object other$version = other.getVersion();
                    if (this$version == null) {
                        if (other$version == null) {
                            break label120;
                        }
                    } else if (this$version.equals(other$version)) {
                        break label120;
                    }

                    return false;
                }

                Object this$license = this.getLicense();
                Object other$license = other.getLicense();
                if (this$license == null) {
                    if (other$license != null) {
                        return false;
                    }
                } else if (!this$license.equals(other$license)) {
                    return false;
                }

                label106: {
                    Object this$licenseUrl = this.getLicenseUrl();
                    Object other$licenseUrl = other.getLicenseUrl();
                    if (this$licenseUrl == null) {
                        if (other$licenseUrl == null) {
                            break label106;
                        }
                    } else if (this$licenseUrl.equals(other$licenseUrl)) {
                        break label106;
                    }

                    return false;
                }

                Object this$termsOfServiceUrl = this.getTermsOfServiceUrl();
                Object other$termsOfServiceUrl = other.getTermsOfServiceUrl();
                if (this$termsOfServiceUrl == null) {
                    if (other$termsOfServiceUrl != null) {
                        return false;
                    }
                } else if (!this$termsOfServiceUrl.equals(other$termsOfServiceUrl)) {
                    return false;
                }

                label92: {
                    Object this$host = this.getHost();
                    Object other$host = other.getHost();
                    if (this$host == null) {
                        if (other$host == null) {
                            break label92;
                        }
                    } else if (this$host.equals(other$host)) {
                        break label92;
                    }

                    return false;
                }

                Object this$contact = this.getContact();
                Object other$contact = other.getContact();
                if (this$contact == null) {
                    if (other$contact != null) {
                        return false;
                    }
                } else if (!this$contact.equals(other$contact)) {
                    return false;
                }

                Object this$authorization = this.getAuthorization();
                Object other$authorization = other.getAuthorization();
                if (this$authorization == null) {
                    if (other$authorization != null) {
                        return false;
                    }
                } else if (!this$authorization.equals(other$authorization)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof SwaggerProperties;
    }

    public int hashCode() {
        boolean PRIME = true;
        int result = 1;
        Object $basePackages = this.getBasePackages();
        result = result * 59 + ($basePackages == null ? 43 : $basePackages.hashCode());
        Object $basePath = this.getBasePath();
        result = result * 59 + ($basePath == null ? 43 : $basePath.hashCode());
        Object $excludePath = this.getExcludePath();
        result = result * 59 + ($excludePath == null ? 43 : $excludePath.hashCode());
        Object $title = this.getTitle();
        result = result * 59 + ($title == null ? 43 : $title.hashCode());
        Object $description = this.getDescription();
        result = result * 59 + ($description == null ? 43 : $description.hashCode());
        Object $version = this.getVersion();
        result = result * 59 + ($version == null ? 43 : $version.hashCode());
        Object $license = this.getLicense();
        result = result * 59 + ($license == null ? 43 : $license.hashCode());
        Object $licenseUrl = this.getLicenseUrl();
        result = result * 59 + ($licenseUrl == null ? 43 : $licenseUrl.hashCode());
        Object $termsOfServiceUrl = this.getTermsOfServiceUrl();
        result = result * 59 + ($termsOfServiceUrl == null ? 43 : $termsOfServiceUrl.hashCode());
        Object $host = this.getHost();
        result = result * 59 + ($host == null ? 43 : $host.hashCode());
        Object $contact = this.getContact();
        result = result * 59 + ($contact == null ? 43 : $contact.hashCode());
        Object $authorization = this.getAuthorization();
        result = result * 59 + ($authorization == null ? 43 : $authorization.hashCode());
        return result;
    }

    public String toString() {
        return "SwaggerProperties(basePackages=" + this.getBasePackages() + ", basePath=" + this.getBasePath() + ", excludePath=" + this.getExcludePath() + ", title=" + this.getTitle() + ", description=" + this.getDescription() + ", version=" + this.getVersion() + ", license=" + this.getLicense() + ", licenseUrl=" + this.getLicenseUrl() + ", termsOfServiceUrl=" + this.getTermsOfServiceUrl() + ", host=" + this.getHost() + ", contact=" + this.getContact() + ", authorization=" + this.getAuthorization() + ")";
    }

    public static class AuthorizationScope {
        private String scope = "";
        private String description = "";

        public String getScope() {
            return this.scope;
        }

        public String getDescription() {
            return this.description;
        }

        public void setScope(final String scope) {
            this.scope = scope;
        }

        public void setDescription(final String description) {
            this.description = description;
        }

        public boolean equals(final Object o) {
            if (o == this) {
                return true;
            } else if (!(o instanceof SwaggerProperties.AuthorizationScope)) {
                return false;
            } else {
                SwaggerProperties.AuthorizationScope other = (SwaggerProperties.AuthorizationScope)o;
                if (!other.canEqual(this)) {
                    return false;
                } else {
                    Object this$scope = this.getScope();
                    Object other$scope = other.getScope();
                    if (this$scope == null) {
                        if (other$scope != null) {
                            return false;
                        }
                    } else if (!this$scope.equals(other$scope)) {
                        return false;
                    }

                    Object this$description = this.getDescription();
                    Object other$description = other.getDescription();
                    if (this$description == null) {
                        if (other$description != null) {
                            return false;
                        }
                    } else if (!this$description.equals(other$description)) {
                        return false;
                    }

                    return true;
                }
            }
        }

        protected boolean canEqual(final Object other) {
            return other instanceof SwaggerProperties.AuthorizationScope;
        }

        public int hashCode() {
            boolean PRIME = true;
            int result = 1;
            Object $scope = this.getScope();
            result = result * 59 + ($scope == null ? 43 : $scope.hashCode());
            Object $description = this.getDescription();
            result = result * 59 + ($description == null ? 43 : $description.hashCode());
            return result;
        }

        public String toString() {
            return "SwaggerProperties.AuthorizationScope(scope=" + this.getScope() + ", description=" + this.getDescription() + ")";
        }

        public AuthorizationScope() {
        }
    }

    public static class Authorization {
        private String name = "";
        private String authRegex = "^.*$";
        private List<SwaggerProperties.AuthorizationScope> authorizationScopeList = new ArrayList();
        private List<String> tokenUrlList = new ArrayList();

        public String getName() {
            return this.name;
        }

        public String getAuthRegex() {
            return this.authRegex;
        }

        public List<SwaggerProperties.AuthorizationScope> getAuthorizationScopeList() {
            return this.authorizationScopeList;
        }

        public List<String> getTokenUrlList() {
            return this.tokenUrlList;
        }

        public void setName(final String name) {
            this.name = name;
        }

        public void setAuthRegex(final String authRegex) {
            this.authRegex = authRegex;
        }

        public void setAuthorizationScopeList(final List<SwaggerProperties.AuthorizationScope> authorizationScopeList) {
            this.authorizationScopeList = authorizationScopeList;
        }

        public void setTokenUrlList(final List<String> tokenUrlList) {
            this.tokenUrlList = tokenUrlList;
        }

        public boolean equals(final Object o) {
            if (o == this) {
                return true;
            } else if (!(o instanceof SwaggerProperties.Authorization)) {
                return false;
            } else {
                SwaggerProperties.Authorization other = (SwaggerProperties.Authorization)o;
                if (!other.canEqual(this)) {
                    return false;
                } else {
                    label59: {
                        Object this$name = this.getName();
                        Object other$name = other.getName();
                        if (this$name == null) {
                            if (other$name == null) {
                                break label59;
                            }
                        } else if (this$name.equals(other$name)) {
                            break label59;
                        }

                        return false;
                    }

                    Object this$authRegex = this.getAuthRegex();
                    Object other$authRegex = other.getAuthRegex();
                    if (this$authRegex == null) {
                        if (other$authRegex != null) {
                            return false;
                        }
                    } else if (!this$authRegex.equals(other$authRegex)) {
                        return false;
                    }

                    Object this$authorizationScopeList = this.getAuthorizationScopeList();
                    Object other$authorizationScopeList = other.getAuthorizationScopeList();
                    if (this$authorizationScopeList == null) {
                        if (other$authorizationScopeList != null) {
                            return false;
                        }
                    } else if (!this$authorizationScopeList.equals(other$authorizationScopeList)) {
                        return false;
                    }

                    Object this$tokenUrlList = this.getTokenUrlList();
                    Object other$tokenUrlList = other.getTokenUrlList();
                    if (this$tokenUrlList == null) {
                        if (other$tokenUrlList != null) {
                            return false;
                        }
                    } else if (!this$tokenUrlList.equals(other$tokenUrlList)) {
                        return false;
                    }

                    return true;
                }
            }
        }

        protected boolean canEqual(final Object other) {
            return other instanceof SwaggerProperties.Authorization;
        }

        public int hashCode() {
            boolean PRIME = true;
            int result = 1;
            Object $name = this.getName();
            result = result * 59 + ($name == null ? 43 : $name.hashCode());
            Object $authRegex = this.getAuthRegex();
            result = result * 59 + ($authRegex == null ? 43 : $authRegex.hashCode());
            Object $authorizationScopeList = this.getAuthorizationScopeList();
            result = result * 59 + ($authorizationScopeList == null ? 43 : $authorizationScopeList.hashCode());
            Object $tokenUrlList = this.getTokenUrlList();
            result = result * 59 + ($tokenUrlList == null ? 43 : $tokenUrlList.hashCode());
            return result;
        }

        public String toString() {
            return "SwaggerProperties.Authorization(name=" + this.getName() + ", authRegex=" + this.getAuthRegex() + ", authorizationScopeList=" + this.getAuthorizationScopeList() + ", tokenUrlList=" + this.getTokenUrlList() + ")";
        }

        public Authorization() {
        }
    }

    public static class Contact {
        private String name = "acumes";
        private String url = "";
        private String email = "295277302@qq.common";

        public String getName() {
            return this.name;
        }

        public String getUrl() {
            return this.url;
        }

        public String getEmail() {
            return this.email;
        }

        public void setName(final String name) {
            this.name = name;
        }

        public void setUrl(final String url) {
            this.url = url;
        }

        public void setEmail(final String email) {
            this.email = email;
        }

        public boolean equals(final Object o) {
            if (o == this) {
                return true;
            } else if (!(o instanceof SwaggerProperties.Contact)) {
                return false;
            } else {
                SwaggerProperties.Contact other = (SwaggerProperties.Contact)o;
                if (!other.canEqual(this)) {
                    return false;
                } else {
                    label47: {
                        Object this$name = this.getName();
                        Object other$name = other.getName();
                        if (this$name == null) {
                            if (other$name == null) {
                                break label47;
                            }
                        } else if (this$name.equals(other$name)) {
                            break label47;
                        }

                        return false;
                    }

                    Object this$url = this.getUrl();
                    Object other$url = other.getUrl();
                    if (this$url == null) {
                        if (other$url != null) {
                            return false;
                        }
                    } else if (!this$url.equals(other$url)) {
                        return false;
                    }

                    Object this$email = this.getEmail();
                    Object other$email = other.getEmail();
                    if (this$email == null) {
                        if (other$email != null) {
                            return false;
                        }
                    } else if (!this$email.equals(other$email)) {
                        return false;
                    }

                    return true;
                }
            }
        }

        protected boolean canEqual(final Object other) {
            return other instanceof SwaggerProperties.Contact;
        }

        public int hashCode() {
            boolean PRIME = true;
            int result = 1;
            Object $name = this.getName();
            result = result * 59 + ($name == null ? 43 : $name.hashCode());
            Object $url = this.getUrl();
            result = result * 59 + ($url == null ? 43 : $url.hashCode());
            Object $email = this.getEmail();
            result = result * 59 + ($email == null ? 43 : $email.hashCode());
            return result;
        }

        public String toString() {
            return "SwaggerProperties.Contact(name=" + this.getName() + ", url=" + this.getUrl() + ", email=" + this.getEmail() + ")";
        }

        public Contact() {
        }
    }
}
