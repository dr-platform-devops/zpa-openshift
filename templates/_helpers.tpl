{{/*
Expand the name of the chart.
*/}}
{{- define "zpa-app-connector-openshift.name" -}}
{{- default .Chart.Name .Values.zsglobal.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zpa-app-connector-openshift.fullname" -}}
{{- if .Values.zsglobal.fullnameOverride }}
{{- .Values.zsglobal.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.zsglobal.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "zpa-app-connector-openshift.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zpa-app-connector-openshift.labels" -}}
helm.sh/chart: {{ include "zpa-app-connector-openshift.chart" . }}
{{ include "zpa-app-connector-openshift.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zpa-app-connector-openshift.selectorLabels" -}}
app.kubernetes.io/name: {{ include "zpa-app-connector-openshift.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "zpa-app-connector-openshift.serviceAccountName" -}}
{{- if .Values.zsglobal.serviceAccount.create }}
{{- default (include "zpa-app-connector-openshift.fullname" .) .Values.zsglobal.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.zsglobal.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "mytemplate" -}}
{{- include "zpa-app-connector-openshift.securitycontextconstraints" . | nindent 2 }}
{{- end -}}
