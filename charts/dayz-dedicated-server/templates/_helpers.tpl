{{- define "dayz-dedicated-server.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dayz-dedicated-server.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "dayz-dedicated-server.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}